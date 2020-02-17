---
title: Experience
---

## Prior September 2017

I initially started programming as a hobby, working on various side projects. In high school I took AP Computer Science A + AP Computer Science Principles.

## Northeastern University: September 2017 - January 2020

I graduated with a Bachelor's degree in Computer Science and a GPA of 3.877 / 4. Notable classes include:

- **CS2500 Fundamentals of Computer Science 1**: Writing simple functional programs in Racket
- **CS4992 "Hack Your Own Language"**: Build a DSL in Racket (my group built a JavaDoc-like extension, which parses documentation into Scribble and checks examples)
- **CS2800 Logic and Computation**: Basic theorem proving with ACL2s
- **CS4800 Algorithms and Data**: Basic algorithms
- **CS3650 Systems**: Low-level systems programming (e.g. assembly) and optimization
- **CS4550 Web Development**: Client (jQuery, React, Angular, Elm), server (Java + Spring Boot, node.js express, Elixir + Phoenix), Database (MySQL + JPA, PostgreSQL + Ecto, MongoDB)
- **CS4992 Directed Study**: Read various papers (abstract interpretation, control flow analysis in Scheme, STM) and wrote summaries / implemented the algorithms
- **ENGW3301 Advanced Writing**: Technical writing to different audiences (e.g. research paper, portfolio)
- **CS4910 Verified Compilers**: Build Toy languages / compiler passes in Coq, and prove via simulation relations that the passes preserve semantics
- **CS4500 Software Development**: Collaboratively develop an application in an industry-like scenario, writing design documents and leading / paneling code walks
- **CS4200 Networks and Distributed Systems**: High-level overview of how networks and distributed systems work: the ISO-OSI stack, and examples of layer implementations / protocols / distributed systems used in practice (e.g. Ethernet, TCP, Paxos, HTTP)
- **CS4410 Compilers**: Followed *[Modern Compiler Implementation in ML](https://www.amazon.com/Modern-Compiler-Implementation-Andrew-Appel-ebook/dp/B00D2WQAE8)* and built a Tiger compiler to MIPS (lexer, parser, static semantics, IR generator, assembler, liveness / dataflow analysis, register allocation with coalescing)

While at Northeastern, I've also attended numerous hackathons and clubs, and presented a poster at [RISE](https://www.northeastern.edu/rise/) (a small University expo) on a side project, **TreeScript**.

### NuPRL

Furthermore, I worked at [Northeastern's Programming Research Laboratory (PRL)](http://prl.ccs.neu.edu/) on an R JIT compiler called [RIR](https://github.com/reactorlabs/rir), with a large team. My specific contributions include:

- Creating micro-benchmarks for individual components (e.g. while loops), and profiling them
- "Simple ranges": an optimization pass which compiles `for (i in a:b) ...` into a C-style while loop, avoiding range allocation
- Improved type inference and "type assertions", which validate the inferred types are actually correct in debug mode
- Bytecode serialization / deserialization, so we don't need to recompile the same function across sessions
- Experimented with manually adding extra annotations to functions to improve analysis / optimization, and checking these annotations at runtime
- Specifically, I added an assertion that a function won't modify variables outside of its lexical scope. In the R REPL, if a variable gets modified during execution of said function, the interpreter will signal an error and abort the current command.

We have published one paper, [R Melts Brains](https://arxiv.org/abs/1907.05118). It describes the challenges of implementing a JIT compiler with static analysis in R, mainly because of laziness and first-class environments.

## PRL@PRG Internship: January 2020 - June 2020 (pending)

I'm currently a assistant researcher at the [<PRL@PRG>](https://prl-prg.github.io/) lab in Prague, supervised by Jan Vitek. Right now I continue to work on RIR.
