
=====================================
Pornhub Bookmarks Manager at Your CLI
=====================================


Installation
############

Install required dependencies using your package manager::

    sudo apt install curl jq youtube-dl

Install with your favourite zsh plugin manager::

    zinit load lainiwa/ph-marks


Getting Started
###############

Type ``ph <TAB>`` to see available subcommands.

Let's add a first video to your library:

.. code-block:: console

    $ ph add 'https://www.pornhub.com/view_video.php?viewkey=ph5e6b2338e1256'

The other option is specifying just the viewkey
instead of a full link: ``ph add ph5e6b2338e1256``.

Now list your available videos with the following command:

.. code-block:: console

    $ ph list
    https://www.pornhub.com/view_video.php?viewkey=ph5e6b2338e1256 "WHY Porn Changes the Brain | Science of NoFap [SFW]"

Definitely not the video to be had in one's porn bookmarks :rofl:! Let's delete it:

.. code-block:: console

    $ ph delete ph5e6b2338e1256

Note you can ``ph delete <TAB>`` to insert the id of the video automatically.

Now add a bunch of videos to our library (for educational reasons only):

.. code-block:: console

    $ ph add \
        ph5c877ca9b5f1e ph5c877cecbb277 ph5c87cc007de24 \
        ph5c2a66302d63c ph5c585ffeede61 \
        ph5c0f6597271b0 ph5ddb8051f0d36

Let's say you feel sapiosexual today. You can then issue a search by title:

.. code-block:: console

    $ ph title facts and logic
    https://www.pornhub.com/view_video.php?viewkey=ph5c0f6597271b0 "Ben Shapiro DESTROYS FEMALE LIBERAL WITH FACTS AND LOGIC"
    https://www.pornhub.com/view_video.php?viewkey=ph5ddb8051f0d36 "Ben Shapiro gets BRUTALLY FUCKED by FACTS and LOGIC!!!!"

You can pipe ``ph`` commands into each other to filter them even further:

.. code-block:: console

    $ ph title facts and logic | ph cat anal
    https://www.pornhub.com/view_video.php?viewkey=ph5c0f6597271b0 "Ben Shapiro DESTROYS FEMALE LIBERAL WITH FACTS AND LOGIC"

Categories do not make much sense sometimes...


Configuration
#############

Configuration is being done via environment variables:

+--------------------------+-----------------------------+-------------------------+
| Variable                 |  Default value              | Meaning                 |
+==========================+=============================+=========================+
| PH_MARKS_HOME            | ~/.pornhub                  | Directory with all the  |
|                          |                             | fetched video metadata  |
+--------------------------+-----------------------------+-------------------------+
| PH_MARKS_PARALLELIZATION | 5                           | Number of parallel      |
|                          |                             | metadata fetches        |
+--------------------------+-----------------------------+-------------------------+
| PH_MARKS_BROWSER_CMD     | Auto detection:             | Command to use to open  |
|                          |                             | a link in browser       |
|                          | * firefox --private         |                         |
|                          | * chrom{e,ium} --incognito  |                         |
|                          | * xdg-open                  |                         |
+--------------------------+-----------------------------+-------------------------+


Examples
########

+-------------------------------------------+-----------------------------------+
| Command                                   | Translation                       |
+===========================================+===================================+
| ph category webcam                        | :cinema::                         |
+-------------------------------------------+-----------------------------------+
| ph tag squirting                          | :whale::                          |
+-------------------------------------------+-----------------------------------+
| ph tag fake_taxi | ph open                | Search and open :taxi: in browser |
+-------------------------------------------+-----------------------------------+
| ph ti facts and logic | ph del            | keep nothing but feels            |
+-------------------------------------------+-----------------------------------+
| ph ls | ph del                            | keep nothing                      |
+-------------------------------------------+-----------------------------------+
| rm ~/.pornhub/*                           | basically same as above           |
+-------------------------------------------+-----------------------------------+
| ph tag mexican ukrainian | ph cat big_ass | (:mexico: ∪ :ukraine:) ∩ :peach:  |
+-------------------------------------------+-----------------------------------+


Future Development
##################

ToDo List
=========

* Add fzf+ueberzug interactive filter;

Known Issues
============

* It requires **two** ``<TAB>`` presses to issue completions for the first time for whatever reason.


License
#######
ph-marks source is published under the terms of the `MIT license <LICENSE>`_.
