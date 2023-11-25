#include "cachelab.h"
#include <errno.h>
#include <getopt.h>
#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/** Code Description: the following is a cache simulator.
 *   Some design choices to keep in mind:
 *
 *    - I am using LRU as replacement policy for line eviction.
 *    I do so by keeping track of an LRU counter on every line.
 *
 *    - I have two main functions:
 *    simulate_load
 *    simulate_store
 *    (which perform the actions described as their names)
 *    and main
 *
 **/

// ------------- PART I: DATASTRUCTURE DECLARATION ----------

/**
 *  Line struct: keeps track of the valid, dirty, tag,
 *   block offset and lru counter of each line in the cache
 **/
typedef struct {
    unsigned long long valid;
    unsigned long long dirty;
    unsigned long long tag;
    unsigned long long block_offset;

    unsigned long long lru_counter;
} cache_line_t;

/**
 *  Cache set: implemented as a pointer to an array of lines
 **/
typedef cache_line_t *cache_set;

/**
 *  Cache struct: keeps track of all the intrinsic properties
 *   of the cache, such as s, b, S, E, ...
 *
 *   Content of cache is stored as a pointer to an array of sets
 **/
typedef struct {
    unsigned long long s;
    unsigned long long b;
    unsigned long long S;
    unsigned long long E;
    unsigned long long B;

    cache_set *set_array;
} cache_t;

// --------- HELPER FUNCTIONS ----------
void print_message(void) {
    printf("Usage: ./csim-ref [-v] -s <s> -b <b> -E <E> -t <trace>\n./csim-ref "
           "-h\n-h Print this help message and exit\n-v          Verbose mode: "
           "report effects of each memory operation\n-s <s>      Number of set "
           "index bits (there are 2**s sets)\n-b <b>      Number of block bits "
           "(there are 2**b blocks)\n-E <E>      Number of lines per set "
           "(associativity)\n-t <trace>  File name of the memory trace to "
           "process\n\nThe -s, -b, -E, and -t options must be supplied for all "
           "simulations.");
}

int perform_checks_on_input(int argc) {
    // check correct length
    if (argc < 9) {
        printf("Mandatory arguments missing or zero.\n");
        print_message();
        return 0;
    } else if (argc > 9) {
        printf("Extra arguments passed.\n");
        print_message();
        return 0;
    }

    return 1;
}

int areSBETvalid(unsigned long long s, unsigned long long b,
                 unsigned long long E, char *t) {
    // Testing for valid
    if (s == 999 || b == 999 || E == 999 || t == NULL) {
        printf("Mandatory arguments missing or zero.\n");
        return 0;
    }

    // Testing too large
    if ((s + b < 0) || (s + b) > 63) {
        return 1;
    }

    // Not negative
    if (s < 0 || b < 0 || E < 0) {
        printf("Invalid arguments, smaller than zero.\n");
        return 0;
    }

    return 1;
}

// ------------- PART II: CACHE RELATED FUNCTIONS ----------
/** Documentation of functions in the order they appear in the file:
 * 1. Free cache
 * 2. Create cache
 * 3. Simulate load
 * 4. Simulate store **/

/** @brief Frees the cache **/
void free_cache(cache_t *cache, unsigned long long S, unsigned long long E) {
    for (unsigned long long set_i = 0; set_i < S; set_i++) {
        free(cache->set_array[set_i]);
    }
    free(cache->set_array);
    free(cache);
}

/** @brief Allocates the cache **/
cache_t *create_cache(unsigned long long S, unsigned long long B,
                      unsigned long long E, unsigned long long s,
                      unsigned long long b) {
    cache_t *cache = malloc(sizeof(cache_t));
    cache->set_array = malloc(S * sizeof(cache_set));

    // safety check
    if (cache == NULL) {
        return NULL;
    }
    if (cache->set_array == NULL) {
        return NULL;
    }

    // store cache properties
    cache->s = s;
    cache->b = b;
    cache->S = S;
    cache->B = B;
    cache->E = E;

    // fill in all sets and lines with starting data
    for (unsigned long long set_i = 0; set_i < S; set_i++) {

        cache->set_array[set_i] = malloc(E * sizeof(cache_line_t));
        // safety check
        if (cache->set_array[set_i] == NULL) {
            return NULL;
        }

        for (unsigned long long line_i = 0; line_i < E; line_i++) {
            cache->set_array[set_i][line_i].valid = 0;
            cache->set_array[set_i][line_i].dirty = 0;
            cache->set_array[set_i][line_i].tag = 0;
            cache->set_array[set_i][line_i].block_offset = 0;
            cache->set_array[set_i][line_i].lru_counter = 1;
        }
    }

    return cache;
}

/** @brief Destructively modifies the cache, simulating a load **/
void simulate_load(cache_t *my_cache, csim_stats_t *statistics,
                   unsigned long long address, unsigned long long size) {

    // getting variables
    unsigned long long b = my_cache->b;
    unsigned long long s = my_cache->s;
    unsigned long long E = my_cache->E;
    unsigned long long B = 1UL << b;

    unsigned long long tag_len = 64 - (b + s);
    unsigned long long tag = address >> (s + b);
    // calculate the index number of the set within the cache
    //  set index
    unsigned long long set_index = (address << tag_len) >> (tag_len + b);
    unsigned long long mask_set = ~((~0UL) << s);
    set_index = set_index & mask_set;

    // first of all, add 1 to lru counter of all lines in set
    for (unsigned long long line_i = 0; line_i < E; line_i++) {
        my_cache->set_array[set_index][line_i].lru_counter++;
    }

    // create new_line
    cache_line_t new_line;
    new_line.valid = 1;
    new_line.tag = tag;
    new_line.block_offset = size;
    new_line.lru_counter = 1;

    //
    bool is_empty = false;
    unsigned long long empty_line_index = 999;
    bool found_hit = false;
    // LOOP THROUGH EACH LINE CHECKING FOR: hit, empty, empty line
    for (unsigned long long line_i = 0; line_i < E; line_i++) {
        /* cache_line_t current_line = target_set[line_i]; */
        cache_line_t current_line = my_cache->set_array[set_index][line_i];
        // is line empty
        if ((current_line.valid == 0) && !is_empty) {
            is_empty = true;
            empty_line_index = line_i;
        }

        // is it a hit?
        if ((current_line.tag == tag) && (current_line.valid == 1) &&
            (!found_hit)) {
            // hits += 1
            statistics->hits++;
            // set lru to 1
            /* current_line.lru_counter = 1; */
            my_cache->set_array[set_index][line_i].lru_counter = 1;
            found_hit = true;
        }
    }

    // is miss
    if (!found_hit) {
        // miss += 1
        statistics->misses++;

        // eviction not needed
        if (is_empty) {
            my_cache->set_array[set_index][empty_line_index] = new_line;
        }
        // eviction needed
        else {
            // select line to evict
            unsigned long long max_lru = 0;
            unsigned long long evicted_line_index = 999;

            for (unsigned long long i = 0; i < E; i++) {
                unsigned long long curr_lru =
                    my_cache->set_array[set_index][i].lru_counter;
                if (curr_lru > max_lru) {
                    max_lru = curr_lru;
                    evicted_line_index = i;
                }
            }

            // evict line
            my_cache->set_array[set_index][evicted_line_index] = new_line;

            // is it dirty eviction?
            if (my_cache->set_array[set_index][evicted_line_index].dirty == 1) {
                statistics->dirty_evictions = statistics->dirty_evictions + B;
                my_cache->set_array[set_index][evicted_line_index].dirty = 0;
            }

            // evictions += 1
            statistics->evictions++;
        }
    }
}

/** @brief Destructively modifies the cache, simulating a store **/
void simulate_store(cache_t *my_cache, csim_stats_t *statistics,
                    unsigned long long address, unsigned long long size) {

    // getting variables
    unsigned long long b = my_cache->b;
    unsigned long long s = my_cache->s;
    unsigned long long E = my_cache->E;
    unsigned long long B = 1UL << b;

    unsigned long long tag_len = 64 - (b + s);
    unsigned long long tag = address >> (s + b);

    // calculate the index number of the set within the cache
    unsigned long long set_index = (address << tag_len) >> (tag_len + b);
    unsigned long long mask_set = ~((~0UL) << s);
    set_index = set_index & mask_set;

    // first of all, add 1 to lru counter of all lines in set
    for (unsigned long long line_i = 0; line_i < E; line_i++) {
        my_cache->set_array[set_index][line_i].lru_counter++;
    }

    bool is_empty = false;
    unsigned long long empty_line_index = 999;
    bool found_hit = false;
    // LOOP THROUGH EACH LINE CHECKING FOR: hit, empty, empty line
    for (unsigned long long line_i = 0; line_i < E; line_i++) {
        cache_line_t current_line = my_cache->set_array[set_index][line_i];
        // is line empty
        if ((current_line.valid == 0) && !is_empty) {
            is_empty = true;
            empty_line_index = line_i;
        }

        // is it a hit?
        if ((current_line.tag == tag) && (current_line.valid == 1) &&
            (!found_hit)) {
            // hits += 1
            statistics->hits++;

            // set lru to 1
            my_cache->set_array[set_index][line_i].lru_counter = 1;
            found_hit = true;

            // set dirty bit to 1
            my_cache->set_array[set_index][line_i].dirty = 1;
        }
    }

    // is miss
    if (!found_hit) {
        // create new_line
        cache_line_t new_line;
        new_line.valid = 1;
        new_line.tag = tag;
        new_line.block_offset = size;
        new_line.lru_counter = 1;
        new_line.dirty = 1;

        // miss += 1
        statistics->misses++;

        // eviction not needed
        if (is_empty) {

            // set dirty bit to 1
            new_line.dirty = 1;
            my_cache->set_array[set_index][empty_line_index] = new_line;
        }
        // eviction needed
        else {
            // select line to evict
            unsigned long long max_lru = 0;
            unsigned long long evicted_line_index = 999;

            for (unsigned long long i = 0; i < E; i++) {
                unsigned long long curr_lru =
                    my_cache->set_array[set_index][i].lru_counter;
                if (curr_lru > max_lru) {
                    max_lru = curr_lru;
                    evicted_line_index = i;
                }
            }

            // evict line
            if (my_cache->set_array[set_index][evicted_line_index].dirty == 1) {
                my_cache->set_array[set_index][evicted_line_index] = new_line;
                // clear dirty bit
                my_cache->set_array[set_index][evicted_line_index].dirty = 1;

                // classify as dirty eviction
                statistics->dirty_evictions = statistics->dirty_evictions + B;
            } else {
                // perform evict
                my_cache->set_array[set_index][evicted_line_index] = new_line;
                my_cache->set_array[set_index][evicted_line_index].dirty = 1;
            }

            // evictions += 1
            statistics->evictions++;
        }
    }
}

// ---------- PART III: Main --------
int main(int argc, char **argv) {
    // check if valid arguments
    int isValidArgs = perform_checks_on_input(argc);
    if (!isValidArgs)
        return 1;

    unsigned long long s = 999;
    unsigned long long b = 999;
    unsigned long long E = 999;
    char *t;
    int option_index = 0;

    errno = 0;
    while ((option_index = getopt(argc, argv, "s:b:E:t:")) != -1) {
        switch (option_index) {
        case 's':
            s = strtoul(optarg, NULL, 10);

            if (errno != 0) {
                printf("s is not valid\n;");
                return 0;
            }
            break;

        case 'b':
            b = strtoul(optarg, NULL, 10);
            if (errno != 0) {
                printf("b is not valid\n;");
                return 0;
            }
            break;
        case 'E':
            E = strtoul(optarg, NULL, 10);
            if (errno != 0) {
                printf("E is not valid\n;");
                return 0;
            }
            break;

        case 't':
            t = optarg;
            break;

        default:
            printf("Flag given that is not -s, -b, -E nor -t\n");
            return 1;
            break;
        }
    }

    // Testing if valid args passed
    if (!areSBETvalid(s, b, E, t))
        return 1;

    // Declaring cache variables
    unsigned long long S = 1UL << s; // 2^s
    unsigned long long B = 1UL << b; // 2^b

    // Setting up statistics
    csim_stats_t *statistics = calloc(1, sizeof(csim_stats_t));
    // safety check
    if (statistics == NULL) {
        printf("Invalid statistics allocation\n");
        return 1;
    }

    // setting up cache
    cache_t *my_cache = create_cache(S, B, E, s, b);
    if (my_cache == NULL) {
        printf("Invalid cache allocation\n");
        return 1;
    }

    // DOING THE TRACE
    const char *trace = t;
    FILE *tfp = fopen(trace, "rt");
    if (!tfp) {
        fprintf(stderr, "Error opening %s: %s\n", trace, strerror(errno));
        return 1;
    }

    int LINELEN = 21;
    char linebuf[LINELEN];

    while (fgets(linebuf, LINELEN, tfp)) {
        // check length of line buf <= LINELEN
        unsigned long length = sizeof(linebuf) / sizeof(linebuf[0]);
        if ((length <= 0) || (length > 21)) {
            printf("Length of line not valid\n");
            return 0;
        }

        // Parse the line of text in linebuf
        char action;
        unsigned long long address;
        unsigned long long size;
        // KEY: llx so that we get the hexadecimal
        int number_args =
            sscanf(linebuf, " %c %llx,%llu", &action, &address, &size);

        // If any part of the parsing fails, won't be 3 arguments
        if (number_args != 3) {
            printf("Parse error found while reading input file\n");
            return 0;
        }

        switch (action) {
        case 'L':
            simulate_load(my_cache, statistics, address, size);
            break;

        case 'S':
            simulate_store(my_cache, statistics, address, size);
            break;

        default:
            // reject invalid
            printf("Invalid operation, only L or S valid\n");
            return 1;
            break;
        }
    }
    fclose(tfp);

    // Get dirty_bytes
    unsigned long long dirty_line_count = 0;
    for (unsigned long long set_i = 0; set_i < S; set_i++) {
        for (unsigned long long line_i = 0; line_i < E; line_i++) {
            if (my_cache->set_array[set_i][line_i].dirty == 1) {
                dirty_line_count++;
            }
        }
    }
    statistics->dirty_bytes = dirty_line_count * B;

    // Print statistics
    printSummary(statistics);

    // FREE VARIABLES
    free_cache(my_cache, S, E);
    free(statistics);

    // Everything processed correctly
    return 0;
}
