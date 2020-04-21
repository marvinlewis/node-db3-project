const db = require('../data/schemes.db3');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}

function find () {
    return db('schemes')
}

function findById (id) {
    return db('schemes').where({ id }).first()
}

function findSteps (id) {
// select schemes.scheme_name, steps.step_number
// from schemes
// join steps on steps.scheme_id = schemes.id
// order by steps.step_number
    return db.select('schemes')
    .join('steps', 'steps.scheme_id', 'schemes.id')
    .select('schemes.scheme_name', 'steps.step_number')
    .where({ id })
    .orderBy('steps.step_number')
}

function add(scheme) {
    return db('schemes')
    .insert(scheme, 'id')
    .then(([ id ]) => {
        return findById(id)
    })
}

function update(changes, id) {
    return db('schemes')
    .where({ id })
    .update(changes)
    .then(change => {
        return findById(id)
    })
}

function remove(id) {
    return db('schemes')
    .where({ id })
    .del()
}

