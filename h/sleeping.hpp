//
// Created by os on 6/23/23.
//

#ifndef PROJECT_BASE_V1_1_SLEEPING_HPP
#define PROJECT_BASE_V1_1_SLEEPING_HPP

class TCB;
class sleeping{
private:
    static TCB* head;
public:

    static int put(TCB* thrd, int sleep_time);
    static void timeDecrease();

};
#endif //PROJECT_BASE_V1_1_SLEEPING_HPP
