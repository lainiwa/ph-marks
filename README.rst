
=====================================
Pornhub bookmarks manager at your CLI
=====================================


Installation
############

Install required dependencies using your package manager::

    sudo apt install curl jq youtube-dl

Install with your favourite zsh plugin manager::

    zinit load lainiwa/ph-bookmarks


Getting started
###############

Type ``ph <TAB>`` to see available subcommands.

Let's add a new video to your porn library:

.. code-block:: console

    $ ph add 'https://www.pornhub.com/view_video.php?viewkey=ph5e6b2338e1256'

The other option is specifying just the viewkey instead of a full link: ``ph add ph5e6b2338e1256``.

Now list your available videos with the following command:

.. code-block:: console

    $ ph lst
    https://www.pornhub.com/view_video.php?viewkey=ph5e6b2338e1256 "COVID-19: Russian medicine"


Configuration
#############

Configuration is being done via environment variables:

+---------------------+----------------+-------------------------+
| Variable            |  Default value | Meaning                 |
+=====================+================+=========================+
| PH_MARKS_HOME       | ~/.pornhub     | Directory with all the  |
|                     |                | fetched video metadata. |
+---------------------+----------------+-------------------------+
| PH_PARALLEL_FETCHES | 5              | Number of parallel      |
|                     |                | metadata fetches        |
+---------------------+----------------+-------------------------+


Future Development
##################

ToDo List
=========

* Add fzf+ueberzug interactive filter.

Known Issues
============

* It requires **two** ``<TAB>`` presses to issue completions for the first time for whatever reason.


License
#######
ph-marks source is published under the terms of the `MIT license <LICENSE>`_.
