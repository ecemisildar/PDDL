(define (problem garden-problem)

(:domain garden)

    (:objects 
        p1 p2 p3 p4 ;plants
        v1 v2 v3 v4 ;vases
        crate ;crate
        spotA spotB spotC spotD ;fields
        store ;store
        gripper ;hand
    )
    
    (:init
        ;plants
        (PLANT p1)(PLANT p2)(PLANT p3)(PLANT p4)
        ;vases
        (VASE v1) (VASE v2) (VASE v3) (VASE v4)
        ;crate
        (CRATE crate)
        ;locations A,B,C,D and store
        (LOCATION spotA)(LOCATION spotB)(LOCATION spotC)(LOCATION spotD)(LOCATION store)
        ;robot hand
        (HAND gripper)
        ;which plants are in the crate
        (in-crate p1 crate)(in-crate p2 crate)(in-crate p3 crate)(in-crate p4 crate)
        ;where is crate
        (at-crate crate store)
        ;where are the vases
        (at-vase v1 store)(at-vase v2 store)
        (at-vase v3 store)(at-vase v4 store)
        ;reachable locations
        (reachable store spotA)(reachable store spotB)
        (reachable spotA spotC)(reachable spotB spotD)
        ;initial vase conditions
        (empty v1)(empty v2)(empty v3)(empty v4)
        ;hand
        (free gripper)
        ;empty spots at the beginning
        (empty-spot spotA)(empty-spot spotB)(empty-spot spotC)(empty-spot spotD)
    )
    
    (:goal 
        (and
        ;plants are in the vases
        (in-vase p1 v1)(in-vase p2 v2)(in-vase p3 v3)(in-vase p4 v4)
        ;vases are at the spots
        (at-vase v1 spotA)(at-vase v2 spotB)(at-vase v3 spotC)(at-vase v4 spotD)
        )
    )
    
)