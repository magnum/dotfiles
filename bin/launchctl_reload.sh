#!/bin/bash

echo reloading $1
launchctl unload $1
sleep 1
launchctl load $1
