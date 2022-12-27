(define (domain bar-domain)

    (:requirements :strips)
    
    (:predicates 
        (LOCATION ?l)(GLASS ?g)(CUSTOMER ?c)
        (at-glass ?g ?l);glass is on the shelf or the customer
        (at-disp ?l);dispenser is on the stand or hand
        (left_empty ?hl)(right_empty ?hr);free hands
        (hold-glass ?g ?hl);glass is on the left hand
        (hold-disp ?hr);dispenser is on the right hand
        (filled ?g);glass is full
        (served ?g ?c);glass is served to the customer
    )
    
    (:action fetch;take the glass from its shelf
        :parameters (?g ?l ?hl)
        :precondition (and (GLASS ?g)(LOCATION ?l)
                            (at-glass ?g ?l);glass is on the shelf
                            (left_empty ?hl);left hand is free
                            )
        :effect (and (hold-glass ?g ?hl);glass is holded
                        (not (left_empty ?hl));left hand is no more free
                        (not (at-glass ?g ?l));glass is not at the shelf
                )
    )
    
    (:action unhook;take dispenser from its stand
        :parameters (?hr ?l)
        :precondition (and (LOCATION ?l)
                        (right_empty ?hr);right hand is free
                        (at-disp ?l));dispenser at its stand
        :effect (and (hold-disp ?hr);dispenser is on the right hand
                        (not (at-disp ?l));dispenser is not in the stand
                        (not (right_empty ?hr));righ hand is not free
                )
    )
    
     (:action pour;if both glass and dispenser are holded
        :parameters (?g ?hr ?hl)
        :precondition (and (GLASS ?g)
                        (hold-disp ?hr);dispenser is holded
                        (hold-glass ?g ?hl));glass is on the left hand
        :effect (and (filled ?g));glass is filled
    )
    
    (:action serve;serve filled glass to the customer
        :parameters (?c ?g ?hl ?hr)
        :precondition (and (CUSTOMER ?c)(GLASS ?g)
                        (hold-glass ?g ?hl);glass is holded
                        (right_empty ?hr);right hand is free
                        (filled ?g));glass is filled
        :effect (and (served ?g ?c);glass is served to the customer
                    (left_empty ?hl);left hand is free
                    (not (hold-glass ?g ?hl));glass is not on the left hand
        )
    )
    
    (:action hook;put the dispenser to its stand again
        :parameters (?hr ?l)
        :precondition (and (LOCATION ?l)
                        (hold-disp ?hr));dispenser is holded
        :effect (and (at-disp ?l);dispenser is in the stand
                    (right_empty ?hr);right hand is free
                    (not (hold-disp ?hr));dispenser is not holded on the right hand
        )
    )


)