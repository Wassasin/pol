#include <iostream>

#include "mlockall.h"

using std::cout;
using std::endl;

using namespace pol;

int main(int argc, const char* argv[])
{
    MLockAll mlock;

    cout << "Hi, I am Pol." << endl;
    return 0;
}

// vim: et:sta:bs=2:sw=4:
