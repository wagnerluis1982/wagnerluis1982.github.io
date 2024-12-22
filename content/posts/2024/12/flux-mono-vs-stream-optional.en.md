---
title: "Flux/Mono vs Stream/Optional"
date: 2024-12-16T09:39:49+01:00
draft: false
tags : [java, reactive]

ShowToc: true
TocOpen: true
---

While Project Reactor's **Flux/Mono** and JDK's **Stream/Optional** are different concepts, their API have many similarities, which may lead to confusion among beginners. Project Reactor is a popular Java library that enables reactive programming in Java and promotes resilient and scalable systems. Stream and Optional, available in the JDK since Java 8, promotes a functional programming style in Java.

In this post, we'll make a comparison between them in an attempt to reduce the doubts.

# A few words about Project Reactor

Project Reactor is one of the most popular Java libraries that enable the reactive paradigm.

If you google for "what is project reactor", likely you will find the following: [^spring-reactive]

> Project Reactor is a fully non-blocking foundation with back-pressure support included. It's the foundation of the reactive stack in the Spring ecosystem and is featured in projects such as Spring WebFlux, Spring Data, and Spring Cloud Gateway.

For a more solid understanding, I like to make a comparison between **blocking** and **non-blocking** web servers. In the blocking ones, each request requires a dedicated thread to handle it. While in the non-blocking, this is more refined, each request has different steps which may wait while other requests are being handled.

So, for instance, if 100 requests are sent, it's sure thing that a blocking server will have 100 threads running (or drop the requests if the max number of threads is reached), while a non-blocking server should need a fraction of the number of threads (around 10), saving resources, but without sacrificing the throughput.

Although in many times Project Reactor will be implemented using a Spring project, it's not strictly required. Indeed, you can use it in any project.

It was slightly more than a few words, sorry! 😇

[^spring-reactive]: "Spring Reactive". Accessed Dec 16th 2024. https://spring.io/reactive.

# A few words about Java Stream

Java Stream is, alongside lambda functions, one of the major features introduced in Java 8 enabling the **functional-style programming** for processing collections. Streams allow developers to perform operations on sequences of elements, such as filtering, mapping, and reducing, in a concise and efficient manner.

Before Java 8, Iterator was the closest to Stream that the programmers have available in the JDK. By using the Stream API, verbose loops are replaced with concise functional expressions, boosting the readability, and arguably the writability.

## Be Optional, not null!

Optional, also introduced in Java 8, works similar to Stream, with the same functional-style programming, except that works on a **single value** or no value at all. The main purpose behind Optional is to provide a **null-safe code**, reducing the risk of the dreaded `NullPointerException`.

# Let the comparison begins

## What is common?

1. **Functional programming:**
2. **Pipeline processing:**
3. **Lazy evaluation:**
4. **Intermediate operations:**
5. **Terminal operations:**

## What is different?

The following are a few differences considering the default behavior.

| Flux/Mono                                                                                                     | Stream/Optional                                                                              |
| ------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| Perfect for asynchronous and non-blocking code.                                                               | Ideal for synchronous and blocking code.                                                     |
| Executes in separate threads in the most efficient way. If `block()` is used, it executes in the main thread. | Executes in the main thread. If `parallelStream()` is used, it executes in multiple threads. |
| Both `Flux` and `Mono` disallow null values, which promote null-safe code.                                    | `Optional` is null-safe, but `Stream` is not, and need explicit checks.                      |                                                                                                              |                                                                                              |

### Flux/Mono is efficient for network processing

The non-blocking capabilities of Project Reactor goes beyond network, it's suitable to improve any I/O processing, such as reading or writing to a file.

## Mapping values

Both libraries map values in the same way.

```java
Optional<String> s = Optional.of("hello")
    .map(String::toUpperCase);
```

```java
Mono<String> s = Mono.just("hello")
    .map(String::toUpperCase);
```

[^project-reactor]: "Project Reactor". Accessed Dec 16th 2024. https://projectreactor.io/
[^parallel-stream]: "When to Use a Parallel Stream in Java". Accessed in Dec 21th 2024. https://www.baeldung.com/java-when-to-use-parallel-stream
