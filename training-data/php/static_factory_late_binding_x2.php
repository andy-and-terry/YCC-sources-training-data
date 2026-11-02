<?php
class Model { public static function make(): static { return new static; } }
class User extends Model {}
echo get_class(User::make()), "\n";
