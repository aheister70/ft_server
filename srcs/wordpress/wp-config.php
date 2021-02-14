<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'aheister' );

/** MySQL database password */
define( 'DB_PASSWORD', 'test1234' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '5x5lkHjK_c.|wA]69=BM_S7vDZSr*<)[}%=*6d+}<o2Vab$ki}/YPKkLFnvuNf#Q' );
define( 'SECURE_AUTH_KEY',  'i~/s}Wxt*y0#pPBXZq7!TPBQfr=nloe9.ar46$to>qi?z|uR7FO?kg2((w8t3HPj' );
define( 'LOGGED_IN_KEY',    'uUH,ceLXt;^qmT`9E,IN0{#[$|g#}e|),:UZ&UT-ud*1/^>Ya3GJ%,U?wJrXT]1/' );
define( 'NONCE_KEY',        '`_b *Kd&}v;K8Q?LUG6]%7>>vi,Xe&:7|k n3Xlz[W$-5xP|@k/cz<-idnY^(r?2' );
define( 'AUTH_SALT',        '?/XT%WfL+/IIZh~R7{1OS#(VOG_bsKOJMy@QOgizM@5s|NC})u20[6w&3^rjcd<a' );
define( 'SECURE_AUTH_SALT', 'mvlzE;!vi+ 3@m:L1=i=C`7.H}35|w;ev-b>Xh+oU[bCP_!7aI;cvokq.w $x~i9' );
define( 'LOGGED_IN_SALT',   '_|v23]h|`e|A g%*,];BVVrmS(mRcHW_Y;l?>+^c2|I6[E|u(xW!y_zO=}{8N49H' );
define( 'NONCE_SALT',       'WV65X19QcGM]MOCfo116LHVnyB_ mr3n)8kT$9#X9/kzS(m$/%pA.URU8Rbk= @c' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';