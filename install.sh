#!/bin/bash

sfctl application upload --path SFLabNetApp --show-progress
sfctl application provision --application-type-build-path SFLabNetApp
sfctl application create --app-name fabric:/SFLabNetApp --app-type SFLabNetAppType --app-version 1.0.0
