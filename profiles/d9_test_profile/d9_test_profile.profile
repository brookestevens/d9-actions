<?php

/**
 * @file
 * Enables modules and site configuration for a test profile.
 */

use Drupal\contact\Entity\ContactForm;
use Drupal\Core\Form\FormStateInterface;

/**
 * Implements hook_form_FORM_ID_alter() for install_configure_form().
 *
 * Allows the profile to alter the site configuration form.
 */
function d9_test_profile_form_install_configure_form_alter(&$form, FormStateInterface $form_state) {
  $form['#submit'][] = 'd9_test_profile_form_install_configure_submit';
}

/**
 * Submission handler to sync the contact.form.feedback recipient.
 */
function d9_test_profile_form_install_configure_submit($form, FormStateInterface $form_state) {
  $site_mail = $form_state->getValue('site_mail');
  ContactForm::load('feedback')->setRecipients([$site_mail])->trustData()->save();
}

/**
 * Implements hook_modules_installed().
 *
 * @param $modules
 * Install syslog and uninstall dblog if site is not local
 * Install default content for the site
 */
function d9_test_profile_modules_installed( $modules ){
  if( in_array('d9_test_profile', $modules )){
    $installer = \Drupal::service('module_installer');
    if( isset($_SERVER['LANDO']) ){
      \Drupal::logger('TEST PROFILE')->notice('Performed install task: Detect enviornment [local] ');
    }
    else{
      \Drupal::logger('TEST PROFILE')->notice('Performed install task: Detect enviornment [prod] ');
      $installer->uninstall(['dblog']);
      $installer->install(['syslog']);
      // configure syslog here
      \Drupal::logger('TEST PROFILE')->notice('Performed install task: Install syslog and uninstall dblog');
    }
    // Install default content
    $installer->install(['d9_test_profile_content']);
    \Drupal::logger('TEST PROFILE')->notice('Performed install task: Import default content');
  }
}