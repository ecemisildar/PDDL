(define (domain garden)

(:requirements :strips)

    (:predicates 
        (PLANT ?p)(VASE ?v)(CRATE ?c)(LOCATION ?s)(HAND ?h)
        (in-vase ?p ?v)(in-crate ?p ?c)
        (at-vase ?v ?s)(at-crate ?c ?s)
        (reachable ?s1 ?s2);from store to A,B or from A,B to C,D
        (empty ?v);empty vase
        (free ?h);free hand
        (grab ?v);grab 
        (empty-spot ?s);shows empty spot
    )
    
    (:action put_plant 
        :parameters(?p ?v ?c ?h ?s)
        :precondition(and (PLANT ?p)(VASE ?v)(LOCATION ?s);choose plant vase and store location
                          (at-crate ?c ?s);crate is in the store
                          (at-vase ?v ?s);vase is in the store
                          (in-crate ?p ?c);crate is full of plant
                          (free ?h);robot hand is free
                      )
        :effect(and (in-vase ?p ?v);plant is in the vase
                    (grab ?v);vase is on the hand
                    (not (free ?h));hand is not free 
                    )
    )
    
    (:action move_vase_AB;move the vases from store to A or B
        :parameters(?h ?s1 ?s2 ?v ?c)
        :precondition(and (LOCATION ?s1)(LOCATION ?s2)(VASE ?v);choose locations as store and A or B
                        (grab ?v);which vase is holded
                        (at-crate ?c ?s1);where is the crate
                        (empty-spot ?s2);is this spot empty
                        (reachable ?s1 ?s2);from store to A or B
                    )
        :effect(and (at-vase ?v ?s2);vase is at the spot
                    (free ?h);hand is free
                    (not (grab ?v));vase not holded
                    (not (empty-spot ?s2));spot is not empty
                    )
    )
    
    
    (:action move_vase_CD;move the vases from store to C or D through A or B
        :parameters(?h ?s1 ?s2 ?s3 ?v1 ?v2)
        :precondition(and (LOCATION ?s1)(LOCATION ?s2)(LOCATION ?s3);s1 = store, s2 = A or B, s3 = C or D
                        (grab ?v1);vase is holded
                        (at-vase ?v2 ?s2);A or B
                        (reachable ?s1 ?s2);from store to A or B
                        (reachable ?s2 ?s3);from A or B to C or D
                        (empty-spot ?s3);C or D is empty
                    )
        :effect(and (at-vase ?v1 ?s3);vase is at the spot
                    (free ?h);hand is free
                    (not (grab ?v1));vase is holded
                    (not (empty-spot ?s3));spot is not free
        )
    )
    
    
   
    
    
    
    
    
    
     
    
    
)