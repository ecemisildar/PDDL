(define (domain truck-domain)
    
    (:requirements :strips)
    
    (:predicates 
        (LOCATION ?l)(CONTAINER ?c)(TRUCK ?t)
        (large ?c)(small ?c);container size
        (tr-loc ?t ?l)(cont-loc ?c ?l);truck and container locations
        (goal-loc ?l);location 5
        (load_large ?t);free for 40 ft container
        (loaded_large ?t ?c);filled with 40 ft container
        
        (load_left ?t)(load_right ?t);free for 20 ft containers
        (loaded_left ?t ?c)(loaded_right ?t ?c);filled with 20 ft containers
        (placed ?c ?l);container is in the goal location
        
    )
    
    
    (:action load_small_1; load first 20 ft object to the 2. truck
        :parameters(?t ?c ?l)
        :precondition(and (CONTAINER ?c)(small ?c);small container is chosen
                        (load_left ?t);left side of the 2. truck is free
                        (LOCATION ?l)
                        (tr-loc ?t ?l)(cont-loc ?c ?l);cont and truck are at the same location
        )
        :effect(and (loaded_left ?t ?c);left side is filled
                    (not (cont-loc ?c ?l));container is not in the location
                    (not (load_left ?t));left side of the truck is not free
        )
    )
    
    (:action load_small_2; load second 20 ft object to the 2. truck
        :parameters(?t ?c1 ?c2 ?l)
        :precondition(and (load_right ?t);right side of the 2. truck is free
                        (LOCATION ?l)
                        (CONTAINER ?c2)(small ?c2);small container is chosen
                        (tr-loc ?t ?l)(cont-loc ?c2 ?l);cont and truck are at the same location
                        (loaded_left ?t ?c1);left side is filled
        )
        :effect(and (loaded_right ?t ?c2);right side is filled
                    (not (cont-loc ?c2 ?l));container is not in the location
                    (not (load_right ?t));right side of the truck is not free
        )
    )
    
    (:action unload_small;unload 2 20 ft containers
        :parameters(?l ?t ?c1 ?c2)
        :precondition(and (loaded_right ?t ?c1)(loaded_left ?t ?c2);both sides of the truck is filled
                        (goal-loc ?l)(tr-loc ?t ?l);truck is in the goal location
        )
        :effect(and (load_right ?t)(load_left ?t);both sides of the truck 2 are free
                    (placed ?c1 ?l)(placed ?c2 ?l);two containers are placed to the goal location
                    (not (loaded_left ?t ?c2));left side is not filled
                    (not (loaded_right ?t ?c1));right side is not filled
        )
    )
    
    (:action load_large ;truck_1 takes the 40 ft containers
        :parameters(?t ?c ?l)
        :precondition(and (CONTAINER ?c)(large ?c);large container is chosen
                        (LOCATION ?l)
                        (load_large ?t);truck 1 is free
                        (tr-loc ?t ?l)(cont-loc ?c ?l);cont and truck are at the same location
        )
        :effect(and (loaded_large ?t ?c);truck 1 is full
                    (not (cont-loc ?c ?l));container is not in the location
                    (not (load_large ?t));truck 1 is not free
        )
    )
    
    (:action unload_large ;truck 1 unloads the 40 ft containers
        :parameters(?t ?l ?c)
        :precondition(and (CONTAINER ?c)(large ?c);large container
                            (LOCATION ?l)
                            (loaded_large ?t ?c);truck 1 is full
                            (goal-loc ?l)(tr-loc ?t ?l);cont and truck are at the same location
        )
        :effect(and (load_large ?t);truck 1 is free
                    (placed ?c ?l);container is at the goal location
                    (not (loaded_large ?t ?c));truck 1 is not loaded
        )
    )
    
    (:action move ;to change trucks location
        :parameters(?from ?to ?t)
        :precondition(and (TRUCK ?t)(LOCATION ?from)(LOCATION ?to)
                        (tr-loc ?t ?from)
        )
        :effect(and (tr-loc ?t ?to)
                    (not (tr-loc ?t ?from))
        )
    )
    
    
)