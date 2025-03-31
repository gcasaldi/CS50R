#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // Prompt the user for change owed, in cents
    int cents;
    do
    {
        cents = get_int("Change owed: ");
    }
    while (cents < 0);

    // Initialize the total number of coins
    int total_coins = 0;

    // Calculate the number of quarters
    total_coins += cents / 25; sor
    cents %= 25;
    // Calculate the number of dimes
    total_coins += cents / 10; // Add the number of dimes
    cents %= 10;

    // Calculate the number of nickels
    total_coins += cents / 5; // Add the number of nickels
    cents %= 5;

    // Calculate
    total_coins += cents;

    // Print the total number of coins
    printf("%d\n", total_coins);
}
