package main

import "fmt"

type chatMediator interface {
	broadcast(sender string, message string)
	register(user *chatUser)
}

type chatUser struct {
	name     string
	mediator chatMediator
}

func (u *chatUser) send(message string) {
	fmt.Println(u.name, "sends:", message)
	u.mediator.broadcast(u.name, message)
}

func (u *chatUser) receive(sender string, message string) {
	if sender != u.name {
		fmt.Println(u.name, "received from", sender+":", message)
	}
}

type chatRoom struct {
	users []*chatUser
}

func newChatRoom() *chatRoom {
	return &chatRoom{}
}

func (r *chatRoom) register(user *chatUser) {
	user.mediator = r
	r.users = append(r.users, user)
}

func (r *chatRoom) broadcast(sender string, message string) {
	for _, u := range r.users {
		u.receive(sender, message)
	}
}

func main() {
	room := newChatRoom()

	alice := &chatUser{name: "Alice"}
	bob := &chatUser{name: "Bob"}
	carol := &chatUser{name: "Carol"}

	room.register(alice)
	room.register(bob)
	room.register(carol)

	alice.send("hello everyone")
	bob.send("hi Alice")
}
