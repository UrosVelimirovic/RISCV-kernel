//
// Created by os on 6/26/23.
//

#include "../h/list.hpp"
#include "../h/TCB.hpp"

void List::addLast(TCB* data)
{
    data->next = 0;
    if (tail)
    {
        tail->next = data;
        tail = data;
    } else head = tail = data;

}

TCB* List::removeFirst()
{
    if (!head) return 0;

    TCB* elem = head;
    head = head->next;
    if (!head) tail = 0;

    return elem;
}