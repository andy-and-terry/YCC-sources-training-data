<?php
// Collapse repeated characters with preg_replace.
echo preg_replace('/(.)\1+/', '$1', "aabbbcdd"), "\n";
