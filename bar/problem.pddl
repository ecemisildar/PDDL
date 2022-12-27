(define (problem bar-problem)

(:domain bar-domain)


    (:objects
        glass1 glass2 glass3 glass4;glasses
        dispenser
        costumer1 costumer2 costumer3 costumer4;customers
        shelf stand;locations
        hand_left hand_right;two robot hands
    )
    
    (:init
        ;customers 1,2,3,4
        (CUSTOMER costumer1)(CUSTOMER costumer2)(CUSTOMER costumer3)(CUSTOMER costumer4)
        ;glasses 1,2,3,4
        (GLASS glass1)(GLASS glass2)(GLASS glass3)(GLASS glass4)
        ;locations as shelf and stand
        (LOCATION shelf)(LOCATION stand)
        ;glass location
        (at-glass glass1 shelf)(at-glass glass2 shelf)
        (at-glass glass3 shelf)(at-glass glass4 shelf)
        ;dispenser location
        (at-disp stand)
        ;free hands
        (left_empty hand_left)(right_empty hand_right)
    )
    
    (:goal ;all filled glasses are served to the customers
        (and (served glass1 costumer1)(served glass2 costumer2)
            (served glass3 costumer3)(served glass4 costumer4))
    )




)