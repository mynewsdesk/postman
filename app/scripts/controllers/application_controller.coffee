Postman.ApplicationController = Ember.ObjectController.extend
  email: null
  selected_category: 'all'
  categories: [
    "all",
    "AlertMailer#alert",
    "BulkMailer#distribute_material",
    "BulkMailer#newsletter_items",
    "DashboardMailer#weekly",
    "NetworkMailer#contact_message",
    "NetworkMailer#invitation",
    "NetworkMailer#network_email",
    "PaymentMailer#first_reminder",
    "PaymentMailer#payment_failure",
    "PaymentMailer#payment_success",
    "PaymentMailer#second_reminder",
    "PaymentMailer#second_reminder_payment_failure",
    "StatsMailer#item",
    "StatsMailer#pressroom",
    "StatsMailer#web",
    "StatsMailer#web_referrers",
    "SubscriptionMailer#digest",
    "SubscriptionMailer#subscription",
    "TargetedMailer#comment_notification",
    "TargetedMailer#contact_message",
    "TargetedMailer#invitation",
    "TargetedMailer#mail_item_to_a_friend",
    "TargetedMailer#mail_pressroom_to_a_friend",
    "TargetedMailer#mail_url_to_a_friend",
    "TransactionalMailer#access_invitation",
    "TransactionalMailer#comment",
    "TransactionalMailer#confirm_subscription",
    "TransactionalMailer#customer_signup",
    "TransactionalMailer#download_contacts",
    "TransactionalMailer#email_activation",
    "TransactionalMailer#forgot_password",
    "TransactionalMailer#journalist_signup",
    "TransactionalMailer#mm_email_notification",
    "TransactionalMailer#mm_profile_about_to_expire",
    "TransactionalMailer#new_follower",
    "TransactionalMailer#notify_about_removal",
    "TransactionalMailer#notify_account_manager_that_source_about_to_expire",
    "TransactionalMailer#trial_expiry",
    "TransactionalMailer#trial_expiry_soon",
    "TransactionalMailer#welcome_follower",
    "TransactionalMailer#notify_about_unblock"
  ]
  actions:
    search: ->
      @transitionToRoute 'email.events', category: @get('selected_category'), email: @get('email')
