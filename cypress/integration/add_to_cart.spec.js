describe('add to cart', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  });

  it('adds product to cart', () => {
    cy.get('nav a[href="/cart"]').contains('0')
    cy.get('article').first().get('button').contains('Add').click({ force: true })
    cy.get('nav a[href="/cart"]').contains('1')
  });
})