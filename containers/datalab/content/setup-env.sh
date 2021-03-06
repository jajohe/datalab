#!/bin/sh
# Copyright 2015 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Sets up various environment variables within the docker container.

export DATALAB_ENV="local"
export CLOUDSDK_CONFIG=/content/datalab/.config

if [ "${ENABLE_USAGE_REPORTING}" = "true" ]
then
  if [ -n "${PROJECT_ID}" ]
  then
    USER_EMAIL=`gcloud auth list --format="value(account)"`
    if [ -n "${USER_EMAIL}" ]
    then
      export PROJECT_NUMBER=`gcloud projects describe "${PROJECT_ID}" --format 'value(projectNumber)'`
    fi
  fi
fi

if [ -n "${EXPERIMENTAL_KERNEL_GATEWAY_URL}" ]
then
  export KG_URL="${EXPERIMENTAL_KERNEL_GATEWAY_URL}"
fi
