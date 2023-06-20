/**
 * to not wrap every handler in a try catch and call next
 * we'll wrap each handle with this function.
 * @example
 *
 * Router.get(asyncHandler(controller))
 *
 * @param {Function} fn
 */

export const asyncHandler = (fn) => (req, res, next) =>
  Promise.resolve(fn(req, res, next)).catch(next)
