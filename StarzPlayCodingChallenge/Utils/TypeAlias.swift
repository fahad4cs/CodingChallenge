//
//  TypeAlias.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//

import Foundation

// MARK: - Typealias
typealias VoidHandler = () -> Void
typealias OneDoubleParamClosure = (Double) -> Void
typealias OntIntParamClosure = (Int) -> Void
typealias TwoIntParamClosure = (Int, Int) -> Void
typealias CompletionWithSuccess<T: Decodable> = (T) -> Void
typealias CompletionWithServiceError = (AppError) -> Void
typealias CompletionWithError = (ApiError) -> Void
