#!/bin/bash

sfctl application delete --application-id SFLabNetApp
sfctl application unprovision --application-type-name SFLabNetAppType --application-type-version 1.0.0
sfctl store delete --content-path SFLabNetApp
