//
//  TransformOf.swift
//  ObjectMapper
//
//  Created by Syo Ikeda on 1/23/15.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2014-2015 Hearst
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

public class TransformOf<ObjectType, JSONType>: TransformType {
	public typealias Object = ObjectType
	public typealias JSON = JSONType

	fileprivate let fromJSON: (JSONType?) -> ObjectType?
	fileprivate let toJSON: (ObjectType?) -> JSONType?

	public init(fromJSON: @escaping (JSONType?) -> ObjectType?, toJSON: @escaping (ObjectType?) -> JSONType?) {
		self.fromJSON = fromJSON
		self.toJSON = toJSON
	}

	public func transformFromJSON(_ value: AnyObject?) -> ObjectType? {
		return fromJSON(value as? JSONType)
	}

	public func transformToJSON(_ value: ObjectType?) -> JSONType? {
		return toJSON(value)
	}
}
