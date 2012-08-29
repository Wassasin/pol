#include "mlockall.h"

#include <iostream>
#include <sys/mman.h>

using std::cout;
using std::endl;

namespace pol
{
    MLockAll::MLockAll()
        : locked(false)
    {
        int ret = mlockall(MCL_CURRENT | MCL_FUTURE);
        
        if (ret == 0) {
            this->locked = true;
            return;
        }

        cout << "mlockall(MCL_CURRENT | MCL_FUTURE) failed" << endl;

        ret = mlockall(MCL_CURRENT);

        if (ret == 0) {
            this->locked = true;
            return;
        }

        cout << "mlockall(MCL_CURRENT) failed" << endl;
    }

    MLockAll::~MLockAll()
    {
        if (this->locked)
            munlockall();
    }
}

// vim: et:sta:bs=2:sw=4:
