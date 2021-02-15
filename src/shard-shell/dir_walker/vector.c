#include "vector.h"

static void vector_ensure_space(vector *v, size_t capacity) {
    if(v == NULL || capacity == 0) return;

    /* Attempt to reallocate new memory in the items list */
    const char **items = realloc(v->items, sizeof(char*) * capacity);

    if(items) {
        /* Reset the items in the new memory space */
        v->items = items;
        v->alloced = capacity;
    }
}

vector *new_vector(void) {
    vector *v = (vector*)malloc(sizeof(vector));
    v->alloced = vector_init_capacity;
    v->length = 0;
    v->items = (const char**)malloc(sizeof(char*) * v->alloced);
    return v;
}

void vector_add(vector *v, const char *item) {
    if(v == NULL) return;
    if(v->alloced == v->length)
        vector_ensure_space(v, v->alloced * 2);
    v->items[v->length++] = item;
}

size_t vector_length(vector *v) {
    if(v == NULL) return 0;
    return v->length;
}
