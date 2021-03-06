# encoding: UTF-8
#
# Copyright (c) 2010-2017 GoodData Corporation. All rights reserved.
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

require_relative '../base_type'

module GoodData
  module LCM2
    module Type
      class HashType < BaseType
        CATEGORY = :scalar
        INTERNAL_TYPE = HashType

        def check(value)
          value.is_a?(Hash)
        end
      end
    end
  end
end
