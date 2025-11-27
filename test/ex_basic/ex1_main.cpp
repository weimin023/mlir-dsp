#include <iostream>
#include <cstdlib>
#include "basic.h"

int main() {
    int a = 2;
    int b = 4;
    std::cout << "add: " << add(b,a) << std::endl;
    std::cout << "sub: " << sub(b,a) << std::endl;
    std::cout << "mul: " << mul(b,a) << std::endl;
    std::cout << "div: " << my_div(b,a) << std::endl;
    return 0;

}