# [Git Issue 373](https://git.etes.de/edira/edira/-/issues/373)

---

# 1. Breakdown

The goal of this part of the Issue 373 was to rework the damage & probability scores settings inside the company settings. 

These changes mainly include splitting up the database storage and implementing a new table schema. This seperation should result in improvements in the frontend for a better user experience like having the operators and currencies as a dropdown menu to choose instead of copying them manually or improving the display of text and numbers.

![Änderungen Eintrittswahrscheinlichkeits Reiter](../src/img/1.png)

---

# 2. Preparations

## 2.1 Model Creation

```bash
php artisan make:model Company/CompanyDamage
php artisan make:model Company/CompanyProbability
```

!!! Note 
    Generates the eloquent model .php file

---

## 2.2 Database Schema

<details>
<summary>Click to for full code.</summary>
<pre id="codeblock">
<code class="language-php" id="codeblock">Schema::create('company_damage', function (Blueprint $table) {
    $table->id();
    $table->unsignedBigInteger('tenant_id');

    $table->unsignedBigInteger('score_number');
    $table->boolean('is_company_damage');
    $table->string('operator')->index()->default('');
    $table->unsignedBigInteger('value');
    $table->string('currency')->index()->default('');

    $table->timestamps();

    $table->foreign('tenant_id')->references('id')->on('tenants')->onDelete('cascade');
    $table->unique('id');
});</code>
</pre>
</details>

!!! Note 
    Using the `id` attribut as unique identifier is important for later usage because the `tenant_id` can't be used because multiple rows get assigned to the user.
