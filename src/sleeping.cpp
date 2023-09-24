//
// Created by os on 6/23/23.
//


#include "../h/sleeping.hpp"
#include "../h/TCB.hpp"
TCB* sleeping::head = nullptr;

int sleeping::put(TCB *thrd, int sleep_time)
{
    // Exceptional situation check
    if(sleep_time < 0) return -1;
    if(thrd == nullptr) return -1;
    if(sleep_time == 0) return 0;

    // Initialize data
    thrd->setSleeping(true);
    thrd->next = nullptr;

    // Check if list is empty
    if(head == nullptr){
        thrd->setSleepTime(sleep_time);
        head = thrd;
        return 0;
    }

    // Time2 is sleep time that will be decreased as we go through the list trying to find
    // the first sleeping thread with bigger or equal time.
    int time2 = sleep_time;

    // compareTime is a variable that stores the sleeping time of the current as
    // we go through all of them
    int compareTime = 0;

    // prethodni is a thread just before the current one in for loop.
    // temp is the current thread in for loop.
    TCB* prethodni = 0;
    TCB* temp = head;

    // Main Algorithm
    for(;temp != nullptr; temp = temp->next){
        compareTime = temp->getSleepTime();
        if(time2 <= compareTime){
            thrd->setSleepTime(time2);
            thrd->next = temp;
            (prethodni? prethodni->next:head) = thrd;
//            for(;temp != nullptr; temp = temp->next){
//                compareTime = temp->getSleepTime();
//                if(compareTime > 0) temp->setSleepTime(compareTime-time2);
//                else break;
//                if (temp->getSleepTime() == 0) break;
//            }
            temp->setSleepTime(compareTime-time2);
            return 0;
        }
        time2 -= compareTime;
        prethodni = temp;
    }

    // If we get to this section of the code, it means that there is no thread in
    // sleeping list with larger sleeping time, which means that we put our thread at
    // the end of the list.
    thrd->setSleepTime(time2);
    prethodni->next = thrd;

    return 0;
}

void sleeping::timeDecrease() {
    // Check if sleeping list is empty
    if(head == nullptr) return;

    // Update sleep time of the first thread in list
    int sleeptime = head->getSleepTime();
    sleeptime--;
    head->setSleepTime(sleeptime);

    // temp is the current thread in the sleeping list as we go through all of them
    TCB* temp = head;
    while (true){
        // Check if we reached the end of the list
        if(temp == nullptr) break;

        sleeptime = temp->getSleepTime();
        if(sleeptime <= 0){ // We can put == as well, this just makes it more secure
            // Putting the sleeping thread back in scheduler
            temp->setSleeping(false);
            head = temp->next;
            temp->next = 0;
            Scheduler::put(temp);
            temp = head;
        } else break;
    }
}