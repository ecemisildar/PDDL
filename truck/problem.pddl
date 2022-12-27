(define (problem truck-problem)

    (:domain truck-domain)
    
    (:objects 
        truck_1 truck_2;trucks
        location_1 location_2 location_3 location_4 location_5;locations
        large_1 large_2;40 ft containers 
        small_1 small_2 small_3 small_4;20 ft containers
        left right;left side and right side of the truck that carries 20 ft containers
    )
    
    (:init 
        (TRUCK truck_1)(TRUCK truck_2)
        (load_large truck_1);truck 1 carries 40 ft container
        (load_left truck_2)(load_right truck_2);truck 2 carries 2 20 ft containers
        (LOCATION location_1)(LOCATION location_2)(LOCATION location_3)(LOCATION location_4)(LOCATION location_5)
        (CONTAINER large_1)(CONTAINER large_2)
        (CONTAINER small_1)(CONTAINER small_2)(CONTAINER small_3)(CONTAINER small_4)
        (large large_1)(large large_2);40 ft containers
        (small small_1)(small small_2)(small small_3)(small small_4);20 ft containers
        (tr-loc truck_1 location_4)(tr-loc truck_2 location_4);trucks at location_4
        ;container locations at the beginning
        (cont-loc large_1 location_1)(cont-loc large_2 location_1)
        (cont-loc small_1 location_1)(cont-loc small_2 location_2)(cont-loc small_3 location_3)(cont-loc small_4 location_4)
        ;goal location
        (goal-loc location_5)
    )
    
    (:goal ;all containers should be placed in location_5
        (and (placed large_1 location_5)(placed large_2 location_5)
        (placed small_1 location_5)(placed small_2 location_5)(placed small_3 location_5)(placed small_4 location_5)
        )
    )
    
    
)