# File sharing brick

## Introduction

The file sharing brick convert uploaded pdf file to images. Then, a specific widget allow you to read these files online and synchronize your reading with others. This is handy when you want to show a specific section of a document to your auditory. 

## Dependencies

The brick have some dependencies, which are essentially gems to be installed :

* ucengine
* RMagick

## Launch and stop the brick

    $> cd bricks/document
    $> ruby bin/document start
    document: process with pid 83 started.
    $> ruby bin/document stop
    document: trying to stop process with pid 83...
    document: process with pid 83 successfully stopped.

## Events

The brick listen for `internal.file.add` events. When the uploaded file is a pdf the brick will convert it to images. These images will be send back to UCEngine and a `document.conversion.done` event will be send to the meeting where the original `internal.file.add` came from.

### document.conversion.done

Sent by the document brick after a document conversion was successfuly completed. The metadata contains all the generated images id's with a numeric key as index. The `internal.file.add` event at the origin of the conversion is set as parent id. 

 Metadata | Description
---------------|-------------------------------------------------------------------------------------------------------
 0    | First image
 2    | Second image
 ...  | ...
 n    | nth image

## ACL

None.

## Widgets

See [[filesharing widget|widget_filesharing]].