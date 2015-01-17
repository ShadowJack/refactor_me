## Iterations
  1. First week
    * Authenication
    * Models for all entities
    * User page
    * Start of main page creation(latest threads)
  2. Second week
    * Finish main page
    * Tagging for threads and for users
    * Page with thread (without votes mechanism)
  3. Third week
    * Text styling in comments (code snippets and other)
    * Votes for comments
    * Popular threads page
  4. Fourth (and last) week
    * Add avatars for users?
    * Bug fixing
    * Visual improvements
    * Prepare for production
  5. Afterparty
    * Create instance in EC2 || upload to heroku?

## First week
  * ~~Authentication = Devise + OAuth(Github)~~
  * Create models: User, Thread, Comment, Tag. Associations: User-Tag, Thread-Tag, User-Thread(favourite threads)
  * Main page: bootstrap layout + latest threads + filters

##### Change scope for github authentication to just user:email(check if nickneme is returned in this case)
Also get GitHub APP_ID and KEY from environment

