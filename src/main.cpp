#include<iostream>
#include<string>
#include<ncurses.h>

int main() {

    std::cout << "HELLO WORLD" << std::endl;

    initscr();
    addstr("----------\n| hello world |\n----------\n\n");

    addstr("\npress any key to exit...");

    refresh();

    char c = getch();

    addstr(c);

    refresh();

    endwin();

    return EXIT_SUCCESS;
}
