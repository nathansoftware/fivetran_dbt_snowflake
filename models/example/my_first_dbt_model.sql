
{{ config(materialized='table') }}

with FAKE_USERS_RAW as (

    INSERT INTO {{source('PC_FIVETRAN_DB','FAKE_USERS_RAW')}}
    SELECT COUNTRY, FIRST_NAME, LAST_NAME, CPF, OCCUPATION, BIRTHDAY, CITY, ID, _FIVETRAN_DELETED, _FIVETRAN_SYNCED
    FROM {{source('PC_FIVETRAN_DB','FAKE_USERS_RAW')}}
    WHERE METADATA$ACTION='INSERT' AND METADATA$UPDATE='TRUE'

)

INSERT INTO {{source('PC_FIVETRAN_DB','FAKE_USERS_RAW')}}
    SELECT COUNTRY, FIRST_NAME, LAST_NAME, CPF, OCCUPATION, BIRTHDAY, CITY, ID, _FIVETRAN_DELETED, _FIVETRAN_SYNCED
    FROM {{source('PC_FIVETRAN_DB','FAKE_USERS_RAW')}}
    WHERE METADATA$ACTION='INSERT' AND METADATA$UPDATE='TRUE'
