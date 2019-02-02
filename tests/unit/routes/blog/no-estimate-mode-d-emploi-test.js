import { module, test } from 'qunit';
import { setupTest } from 'ember-qunit';

module('Unit | Route | blog/no-estimate-mode-d-emploi', function(hooks) {
  setupTest(hooks);

  test('it exists', function(assert) {
    let route = this.owner.lookup('route:blog/no-estimate-mode-d-emploi');
    assert.ok(route);
  });
});
