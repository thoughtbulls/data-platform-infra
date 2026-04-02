#!/bin/bash

EMAIL=$1

EXISTS=$(databricks account users list | grep "$EMAIL")

if [ -z "$EXISTS" ]; then
  databricks account users create --user-name "$EMAIL"
fi
