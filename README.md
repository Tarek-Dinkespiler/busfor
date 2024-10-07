# Busfor.ua

This repository is destined to initiate a talk with engineers at BlaBlaCar around the future developments of the busfor.ua project and my potential involvement in it.

I was told that this mission for BlaBlaCar required a lot of autonomy. Therefore, communication is likely to be critical. Hence this quite verbose readme file.

I apologize in advance if I'm way off target with my many assumptions. In the meantime, I assure the reader that I did my best considering the very limited information in my possession.

This project is hosted on AWS and can be viewed [here](http://13.39.18.73).

In order to spin locally, please refer to
[this section](#setting-up-locally)

## Business Context

From what I've gathered so far, the aim is to revive the busfor.ua project and make it both :

- Maintainable (by getting rid of some legacy and possibly updating the technical stack)
- Compatible with other resources at BlaBlaCar (maybe by developing or consuming APIs ?)

I have yet to talk to the stakeholders of the project but if it is confirmed that these are the main concerns, then it means that the job should mostly entail :

- Technical debt management
- Integration in an ecosystem of existing apps and services

Once the objectives clarified, I would probably approach the project by assessing the quality of the codebase and mainly answering the following questions :

- What's the language (russian, ukrainian, english, other...) of the current project ?
- Is it properly documented and tested ?
- What's the quality of the dependencies ?
- Is the domain code properly separated and developed with industry standards in mind ?

I would try to quickly come up with a relatively accurate idea of the gap to bridge between the existing and the target. This would help aligning the team on the overall expectations, the global plan of action and of course the timeframe.

In this repository, I tried to examplify some of my skills in solving the problems that I imagine are relevant to the busfor.ua usecase.

## Project details

### What it's supposed to be

This project consists in building an app that looks a little like busfor.ua, that has one or two very basic functionalities I would expect to find in the original product and of course deploying the app to serve it on a public url.

### What it's definitely not

This is in no way a clone of busfor.ua. I felt it was important that this app was more than just code. Since the management of busfor.ua could span from the very product definition to the infrastructure. This is also why I chose to deploy the app however expeditiously.

It is by no means a way to showcase my development skills in ruby on rails. I haven't touched this framework in a few years and even though I was relieved to find out that a lot of my knowledge was still there (and paradoxically had even increased), I'm obviously going to need a bit of time to bring my proficiency up to speed.

Finally, I don't claim to have made the best choices but I do think that many of the critical aspects of software engineering are exposed in this endeavour. By chance, some of them could end up catching the reader's attention depending on their relevancy to the mission.

## Setting up the project

The project will be relying on the current stable versions of ruby and rails :

- ruby 3.3.5
- rails 7.2.1

### Dependencies

There's a saying that "the best code is the one that you don't write". The way I understand this principle is that :

- it's better to write less code than more
- it's better to rely on a library than to write your own service when given the chance

Of course, libraries can be more or less healthy and we've seen occasions where they could even pose security threats. This [medium article](https://david-gilbertson.medium.com/im-harvesting-credit-card-numbers-and-passwords-from-your-site-here-s-how-9a8cb347c5b5) shows how alarmingly dangerous it can be to integrate third party code to your project.

There are of course a few ways to mitigate this issue :

- don't install dependencies unless you really need to
- prefer a library that has been used a lot **and** for a long time
- check the source, some are clearly more reliable than others

You will notice that two of those statements are very contradictory :

- it's better to use a library
- if possible, don't use a library

Well as always with critical points, it ultimately boils down to balancing out pros and cons.

For example :

Let's consider a product requirement where strings containing foreign characters should be transformed into their english equivalent. I think it could be hugely time-consuming for the product team to come up with a set of rules that fit all the sets of symbols that are out there and find the default english equivalent if it exists.

In this particular case, I'd probably consider using a library like [slugify](https://www.npmjs.com/package/slugify). It has a strong consistant 3 million users and no dependencies of its own. However, it doesn't seem to be updated very frequently and I don't really know the authors.

On the other hand, if all we need is to prevent non-english characters in our system, maybe a solution could be to validate the data instead of transforming the data. In which case, a simple, well-tested function could do the trick.

**Of course, the product always comes first.** Therefore, if talks with the product team end up favoring the initial solution to transform the data, I'd dig deeper to assess the liability of the new dependency versus the cost of developing a custom solution. In this case, I would very likely use slugify.

### Data and databases - MariaDB

My experience in relational databases is solely with postgresql. However, I made the choice to go with MariaDB for this project because I think that it's what's being used at BlaBlaCar. This choice ended up considerably complexifying my work.

Since busfor.ua is a live project (or at least has been), I anticipate that there must be production data.

It is most likely that these are precious and need to be backed up and safe guarded as a priority.

It is also likely that these data aren't compliant with current standards of regulations in terms of privacy. For this reason alone, some migrations should alrealy be anticipated let alone for product purposes.

### Tooling : Linting, formatting and committing

**I like my tooling "lean" and "standard".**

Lean for the same reasons that I'm careful with dependencies.

Standard because I think that it's almost always the best approach to development issues.

- Indeed, standard solutions became standard because they are **excellent solutions to standard problems**. In my experience, it's very rare to encounter a situation where the technical issue formulates into a problem that nobody ever encountered. In fact, I don't think that I've met such a situation. Therefore, since I'm working on a problem that (a great) many people have had before, it is likely that someone came up with a solution that has become a standard, a best practice or a pattern.

- And again it's obviously always much **less time-consuming** to apply a solution that has already been developed so many times that it has become a standard than having to design a whole new solution of your own.

In the Node.js ecosystem, I've mostly relied on the eslint, prettier, husky trio. In the ruby world I've mostly used rubocop and brakeman (that's more security oriented). I'd consider some other tools like the ones in this [list](https://medium.com/nyc-ruby-on-rails/5-essential-linters-ruby-on-rails-basics-e48c7a2f2255).

### Testing

There are many different approaches to testing and I'll adapt to the philosophy in place at BlaBlaCar.

My particular take on testing is the following. I don't like to oppose the different types of tests and I like to use them in a complementary way :

- end to end for the whole application divided in identified functionalities
- integration - between the different services
- unit - for specific entities that have a wide variety of possible I/O or edge cases.

I don't generally use TDD except for the functions that need to be unit tested.

If correctly written, the testing suite should document the behavior of the application and describe faithfully the domain.

Bearing in mind that testing has two major goals :

- making a reliable product
- simplifying development

Testing should always reduce technical debt, not extend it !

## Deploying

### CI / CD

Rails apps come with preconfigured assets for github actions and docker. I chose to use these resources and adapt them to my needs.

If I had more time, I'd have set up a github workflow in order to protect deployments and enable a correctly organized development process.

Above all, I'd have worked out a cleaner way to separate all the environments and their relative variables. This is actually one of my biggest frustration in this project.

And finally, I'd have setup a properly automated deployment stage. Currently, it's still manual and incomplete.

### AWS

If I had more time I would definitely have chosen GCP because according to a few sources including this [google resource](https://cloud.google.com/customers/blablacar), it seems that it is the solution for BlaBlaCar.

Unfortunately, I don't have any experience with GCP. However, I have plenty with AWS. Even though I've mostly used serverless resources and developed for lambdas, it was still probably easier for me to use an EC2 instance to host the app than to start from scratch with another cloud service provider.

Still, the current deployment is quite rudimentary. It could benefit from a better cloud architecture leveraging a database such as RDS and a cloudfront distribution for the react app. And obviously, it would be perfect to orchestrate inside the code with tools such as aws cdk.

Above all, the whole thing could be much safer at the instance level and with a better management of secrets.

## Functionalities

### Language - I18n and English

The site seems to offer a choice of translation between russian and ukrainian and from a basic verification with the google translate tool, it appears to be functional. I will therefore assume that some form of I18n was implemented (or at least should be).

The code on the other hand should be fully in english seeing that it is both the obvious choice for international projects such as busfor.ua (and in fact for any projects in my opinion) and the prefered language at BlaBlaCar.

### Travel options search

The search bar on busfor.ua allows any user (logged in or not) to research travel options with the following input :

- departure (city)
- destination (city)
- date (day)
- passengers (number of adults and number of under 14)

I chose to replicate this search bar with fake seeded data over a restricted period of a single week and without the passengers option. I thought it would give the chance to manipulate the database and write models in an idiomatic rails way.

## Front-end choices

Currently, the app is a monolith but it can be broken into a rails api with a front-end consumer app. Actually, If I'm not mistaken, I think that the current busfor.ua site is a rails api with a react front end.

Therefore, if I have time, that's what I'll aim to do. I didn't do that from the get go because I was afraid to waste a lot of time on a more complex deployment. Even if I'm no React expert, I am still quite experienced with this framework and I know how painful it can be to set up (let alone dockerize).

### Tailwind

Rails 7 ships with tailwind. It was my first time using this framework. I was very much looking forward to it because I'd heard many good things about it.

In retrospect, I should have gone for a mobile first design. Obviously, I'm not a UI specialist.

## Setting up locally

In order to start the project, use the docker command to build and start and visit the url : `localhost:80`

### Build and start

```sh
    docker compose up --build --remove-orphans
```

### Teardown

```sh
    docker down
```

### Open bash in rails-app or mariadb

```sh
    docker exec -u root -it rails-app /bin/bash
    docker exec -u root -it mariadb /bin/bash
```
