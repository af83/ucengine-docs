# File sharing brick

## Introduction

The file sharing brick convert uploaded pdf file to images. Then, a specific widget allow you to read these files online and synchronize your reading with others. This is handy when you want to show a specific section of a document to your auditory.

## Dependencies

The brick have some dependencies, which are essentially gems to be installed :

* ucengine
* RMagick

We provide a Gemfile to install these gems.

## Installation

    $> git clone https://github.com/AF83/ucengine-document.git
    $> cd ucengine-document
    $> bundle install

## Launch and stop the brick

    $> bin/document start
    document: process with pid 83 started.
    $> bin/document stop
    document: trying to stop process with pid 83...
    document: process with pid 83 successfully stopped.

## Events

The brick listen for `internal.file.add` events. When the uploaded file is a pdf the brick will convert it to images. These images will be sent back to U.C.Engine and a `document.conversion.done` event will be sent to the meeting where the original `internal.file.add` came from.

Moreover, for each generated file the brick uploads, it adds an *uploadedby* metadata in order to differenciate files uploaded by users and automatically uploaded files.

### document.conversion.done

Sent by the document brick after a document conversion was successfuly completed. The metadata contains all the generated images id's with a numeric key as index. The `internal.file.add` event at the origin of the conversion is set as parent id.

 Metadata | Description
---------------|-------------------------------------------------------------------------------------------------------
 0    | First image
 1    | Second image
 ...  | ...
 n    | nth image

## ACL

None.

## Widgets

See [[filesharing widget|widget_filesharing]].
