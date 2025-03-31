#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Define the person struct
typedef struct person
{
    struct person *parents[2];
    char alleles[2];
}
person;

// Function prototypes
person *create_family(int generations);
void free_family(person *p);
char random_allele(void);
void print_family(person *p, int generation);

// Main function
int main(void)
{
    //  number generator
    srand(time(0));

    // Create a new family with three generations
    int GENERATIONS = 3; // You can change this value to simulate different generations
    person *p = create_family(GENERATIONS);

    //  family tree of blood types
    print_family(p, 0);

    // Free memory
    free_family(p);
}

// Create a new family with the specified number of generations
person *create_family(int generations)
{
    // Allocate memory for a new persona
    person *new_person = malloc(sizeof(person));
    if (new_person == NULL)
    {
        return NULL; 
    }

    // Base case: if generations is 1, assign random alleles and set parents to NULL
    if (generations == 1)
    {
        new_person->parents[0] = NULL;
        new_person->parents[1] = NULL;
        new_person->alleles[0] = random_allele();
        new_person->alleles[1] = random_allele();
    }
    else // crea i genitori
    {
        new_person->parents[0] = create_family(generations - 1);
        new_person->parents[1] = create_family(generations - 1);
        
        // alleles based on the alleles of their parents
        new_person->alleles[0] = new_person->parents[0]->alleles[rand() % 2];
        new_person->alleles[1] = new_person->parents[1]->alleles[rand() % 2];
    }

    //  newly created person
    return new_person;
}

// Free `p` and all ancestors of `p`.
void free_family(person *p)
{
    //  base case
    if (p == NULL)
    {
        return;
    }

    // Free parents 
    free_family(p->parents[0]);
    free_family(p->parents[1]);

    // the  child
    free(p);
}

// Randomly return an allele
char random_allele(void)
{
    int r = rand() % 3; // Random number between 0 and 2
    if (r == 0)
    {
        return 'A';
    }
    else if (r == 1)
    {
        return 'B';
    }
    else
    {
        return 'O';
    }
}

//  the family tree
void print_family(person *p, int generation)
{
    // Handle base case
    if (p == NULL)
    {
        return;
    }

    //  person's blood type
    printf("    Parent (Generation %d): blood type %c%c\n", generation, p->alleles[0], p->alleles[1]);

    //  print parents
    print_family(p->parents[0], generation + 1);
    print_family(p->parents[1], generation + 1);
}
