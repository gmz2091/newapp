/*
 * Copyright 2017 Google
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "FIRFieldPath.h"

#include "Firestore/core/src/firebase/firestore/model/field_path.h"

namespace model = firebase::firestore::model;

NS_ASSUME_NONNULL_BEGIN

@interface FIRFieldPath ()

/** Internal field path representation */
- (const model::FieldPath &)internalValue;

- (instancetype)initPrivate:(model::FieldPath)path NS_DESIGNATED_INITIALIZER;

@end

/** Internal FIRFieldPath API we don't want exposed in our public header files. */
@interface FIRFieldPath (Internal)

+ (instancetype)pathWithDotSeparatedString:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
