//
// Created by os on 6/23/23.
//

#ifndef PROJECT_BASE_V1_1__SEM_HPP
#define PROJECT_BASE_V1_1__SEM_HPP
#include "list.hpp"
#include "TCB.hpp"
class _sem{
public:
    _sem(int init): val(init), closed(false){}

    int close();
    int wait();
    int signal();


    ~_sem(){
        close();
    }
protected:
    void block();
    void unblock();
private:
    int val;
    bool closed;
    List blocked;
};
#endif //PROJECT_BASE_V1_1__SEM_HPP
