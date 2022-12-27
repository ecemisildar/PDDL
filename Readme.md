# BAR PROBLEM 

Consider a bar-tender robot which is supposed to fix drinks for customers. In
order to be served, the drink must be poured into a glass from a dispenser; the
glass should be fetched from a shelf and the dispenser should be unhooked from
its stand. Pouring of the drink requires that the robot holds both the glass and
the dispenser. Formalize actions to fetch glasses, hook/unhook the dispenser
and serve drinks to customers. Consider a scenario where you have four glasses
and one dispenser and you should serve four customers. Initially, all the glasses
are empty and sitting on the shelf and customers are waiting for their drinks.
Formalize the planning domain and a problem file corresponding to the scenario
described. (Note: consider the dispenser to have an infinite supply of drink.)

# GARDEN PROBLEM

Use PDDL-STRIPS to formalize a domain of garden landscaping considering
the following constraints:
• flowering plants are made available in a crate; the crate can contain several
plants;
• to be placed in the garden, a plant must be placed in a vase; a vase can
contain only one plant;
• both the crate and the vases are available at a single location in the garden
(the “store”);
• plants in vases can be moved to spots in the garden; each spot can contain
only one plant;
• some spots are reachable directly from the store, some are reachable
through other spots; passing by a spot is possible only if the spot is not
occupied by a vase.
• a gardener robot can either put a plant in a vase or move a vase to a spot
in the garden, handling one plant and one vase at a time.
The scenario is the following:
• there are four plants in a crate and four empty vases located in the store;
• there are four spots in the garden, of which two are reachable from the
store directly, and two are reachable through other spots; in particular,
spot A and spot B are reachable directly, spot C is reachable through A
and spot D is reachable through B.
The goal is to have all the plants put in the vases and placed in the spots.

# TRUCK PROBLEM

Use PDDL-STRIPS to formalize a logistic domain about locations, trucks and
containers to be delivered, where containers are of two kind: 40 ft and 20 ft
long. Consider the following constraints:
• A truck may haul either one 40ft container or two 20ft containers
• The locations are numbered from 1 to n and they are all connected one
another, so trucks can move freely among locations.
• A location may contain containers or be empty.
• The truck must be at a location to load containers in it.
• The container must be unloaded in a location to be considered there.
In particular, formalize actions to move from one location to another and
load/unload containers, as well as the predicates to characterize the state. For-
malize a problem instance where there are five locations numbered from 1 to 5,
two trucks, two 40 ft containers and four 20 ft containers. Initially, the large
containers are at location 1, and there is one small container for each location
numbered 1 to 4. All trucks are initially at location 4. The goal is to move all
containers at location 5.
