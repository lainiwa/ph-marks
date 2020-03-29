.. image:: https://github.com/lainiwa/ph-marks/workflows/CI/badge.svg
    :target: https://github.com/lainiwa/ph-marks/actions?query=workflow%3ACI

============================================
:kiss: Pornhub Bookmarks Manager at Your CLI
============================================

``ph-marks`` is a zsh plugin, that will let you bookmark pornhub videos. It will **not** download the videos, only their meta information and thumbnails.

Installation
############

Dependencies
============

First of all you will need some dependencies to be present on your system for this plugin to work.

Here is a table of them. The links will lead to the "install" section of each dependency.

+-------------+--------------------------+-----------+-----------------------------+
| Name        | Description              | Necessity | Note                        |
+=============+==========================+===========+=============================+
| coreutils   | Basic command line tools | required  | You are likely to already   |
|             | in UNIX-like systems     |           | have them                   |
+-------------+--------------------------+-----------+-----------------------------+
| jq_         | JSON parser              | required  |                             |
+-------------+--------------------------+-----------+                             |
| youtube-dl_ | Video (metadata)         | required  |                             |
|             | downloader               |           |                             |
+-------------+--------------------------+-----------+-----------------------------+
| fzf_        | Fuzzy picker             | optional  | These two are required for  |
+-------------+--------------------------+-----------+ interactive video filtering |
| ueberzug_   | In-terminal image        | optional  |                             |
|             | viewer                   |           |                             |
+-------------+--------------------------+-----------+-----------------------------+

.. _jq: https://stedolan.github.io/jq/download/
.. _youtube-dl: https://github.com/ytdl-org/youtube-dl#installation
.. _fzf: https://github.com/junegunn/fzf/#installation
.. _ueberzug: https://github.com/seebye/ueberzug#installation


Plugin install
==============

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
|                          | * etc                       |                         |
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
| ph tag squirting | ph fzf | ph open       | Interactively pick a :whale::     |
|                                           | and watch it in browser           |
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


License
#######
ph-marks source is published under the terms of the `MIT license <LICENSE>`_.
