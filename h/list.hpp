//
// Created by os on 5/13/23.
//

#ifndef PROJECT_BASE_V1_1_LIST_HPP
#define PROJECT_BASE_V1_1_LIST_HPP

//ideja za klasu je delimicno preuzeta sa online vezbi 7
class TCB;

class List{
    TCB* head;
    TCB* tail;
public:
    List() : head(0), tail(0) {}

    List(const List&) = delete;

    List &operator=(const List&) = delete;

    void addLast(TCB* data);

    TCB* removeFirst();
};

//#ifndef _list_hpp
//#define _list_hpp
//
//template <typename T>// sa vezbi
//class List{
//private:
//    struct Elem{
//        T* data;
//        Elem* next;
//
//        Elem(T* data, Elem* next): data(data), next(next){}
//    };
//    Elem* head, *tail;
//
//public:
//    List() : head(0), tail(0){}
//
//    List(const List<T> &) = delete;
//    List<T> &operator = (const List<T> &) = delete;
//
//    void addFirst(T* data){
//        Elem* elem = new Elem(data, head);
//        head = elem;
//        if(!tail) {tail = head;}
//    }
//
//    void addLast(T* data){
//        Elem* elem = new Elem(data, 0);
//        if(tail){
//            tail->next = elem;
//            tail = elem;
//        }
//        else{
//            head = tail = elem;
//        }
//    }
//
//    T* removeFirst(){
//        if(!head) {return 0;}
//
//        Elem* elem = head;
//        head = head->next;
//        if(!head) {tail = 0;}
//
//        T* ret = elem->data;
//        delete elem;
//        return ret;
//    }
//
//    T* peekFirst(){
//        if(!head){ return 0; }
//        return head->data;
//    }
//
//    T* removeLast(){ //uzima element sa kraja liste
//        if(!head){ return 0; }
//
//        Elem* prev = 0;
//        for(Elem* curr = head; curr != tail; curr = curr->next){
//            prev = curr;
//        }
//
//        Elem* elem = tail;
//        if(prev){ prev->next = 0; }
//        else { head = 0; }
//        tail = prev;
//
//        T* ret = elem->data;
//        delete elem;
//        return ret;
//    }
//
//    T* peekLast(){ //pogleda element sa kraja liste
//        if(!tail) { return 0; }
//        return tail->data;
//    }
//};
//
//#endif //_list_hpp

#endif //PROJECT_BASE_V1_1_LIST_HPP
