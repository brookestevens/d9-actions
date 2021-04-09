<?php

/**
 * @file
 * Do stuff after the modules are installed
 */

/**
 * Implements hook_modules_installed().
 *
 * @param $modules
 */
funnction d9_test_profile_modules_installed($modules){
   if (in_array('d9_test_profile', $modules)) {
    $theme = 'ucb2019_base';
    \Drupal::service('theme_installer')->install([$theme]);
    \Drupal::service('theme_handler')->setDefault($theme);
  }
}