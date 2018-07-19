/**
 * Copyright (c) 2015-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 * Stub of MTAModule for Android.
 *
 * @format
 * @flow
 */

'use strict';

const NativeMTAModule = require('NativeModules').MTAModule;

/**
 * High-level docs for the MTAModule iOS API can be written here.
 */

const MTAModule = {
  test: function() {
    NativeMTAModule.test();
  },
};

module.exports = MTAModule;
