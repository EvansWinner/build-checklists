# BUILD-CHECKLISTS-DOT-BAT README

Windows batch script gutter-punk way of maintaining sysops schedules

`build-checklists.bat` is a very, very, VERY simple Windows batch
script to make it easier to maintain complicated schedule templates
for computer operators who must live by such checklists, but who may,
due to the standard draconian corporate rules, not have available any
tools other than what comes stock on their Windows PC -- i.e., batch
scripts.  It's purpose is to minimize the number of separate documents
which must be edited and kept in synch when, for example, a single
process is changed or moved in time, that is on multiple different
schedules (eg, we no longer do step three in the Frizzleization
process, so it must be changed on the Monday schedule, the Saturday
night during Lent schedule, the Full Moon When It's Foggy schedule, et
cetera).

The schedule templates are generated using the program
`build-checklists.bat` in this directory.  It can be run by
double-clicking.

As distributed, there are two small schedules already set up, called
"morning" and "night" which should make it apparent how the thing
works.  Just double click on build-checklists.bat to see it work.  It
will create the two new schedule templates in the top-level, called
`morning.txt` and `night.txt`.

The directory `./steps` contains text files.  Each one contains
instructions for one single step or logically unified group of steps.
The build program concatenates them into the schedule templates.  It
concatenates them in the order specified in the files in the `./skel`
directory.  Each file in `./skel` contains a single list of the file
names to be used for the schedule, in the order they will appear in
the schedule.

In order to make a change to a single step, edit that step in the
steps directory.  The name of the step is included in the template
when the template is built, at the bottom of the step, so it is easy
to find the correct file to edit.  Once you have made your changes and
saved them, re-run `build-checklists.bat` to re-build the templates.

The point of doing it this way is that some of the schedules may
naturally share steps -- they have the same steps that other schedules
have.  These steps are used in multiple templates (which means, they
are specified in several different `./skel` files).  Remember that if
your change only applies to one schedule (for example, to the Monday
through Friday template, but not the Saturday template) then you must
create a new step file with a unique name, and change the skel file to
include it.

In other words, the steps directory is a database of steps, containing
files with names like `step1.txt`, `step2.txt` and `step3.txt`.  Each
step file contains instructions for that step.  The ./skel directory
contains lists of which steps, in what order to use to build the
templates themselves.  The files look like this:

> step1.txt

> step3.txt

> step-foo.txt

... etc.

The schedule templates are built from this and placed in the current
directory.  This way, when multiple schedule templates contain the
same step, if that step needs to be modified it need only be modified
in one place -- in the step file, and then all the templates can be
rebuilt at once to reflect the change.

To change the order of steps within a template, without changing the
nature of the step itself, simply edit the skel file for that
template, moving the step to where you want it.  Then rebuild with
`build-checklists.bat`. 

Use the templates only as templates.  For instance, on Monday, make a
copy of your "monday" schedule templates to some daily schedules
directory, and then mark things done on that copy, not on the original
template.  I.e., do not edit the template directly -- your changes
will be overwritten the next time build-checklists.bat is run.

If you need to create an entirely new template, create a new skel file
in the skel directory listing the steps it will use from the steps
directory (creating any you need there) and rebuild.

Note that the templates look better if you have exactly one blank line
at the end of each step file.
