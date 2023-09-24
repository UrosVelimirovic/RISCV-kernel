//
// Created by os on 6/19/23.
//

#ifndef PROJECT_BASE_V1_1_SCHEDULER_HPP
#define PROJECT_BASE_V1_1_SCHEDULER_HPP

class List;
class TCB;

class Scheduler{
private:
    static List readyThreadQueue;


public:
    static TCB* get();

    static void put(TCB* tcb);
};


#endif //PROJECT_BASE_V1_1_SCHEDULER_HPP
